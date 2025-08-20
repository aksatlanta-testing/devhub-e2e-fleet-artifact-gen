
{{- define "go-echo78bd6bc3-6c7e-4d5e-98e4-9e86d4472fbc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo78bd6bc3-6c7e-4d5e-98e4-9e86d4472fbc.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo78bd6bc3-6c7e-4d5e-98e4-9e86d4472fbc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo78bd6bc3-6c7e-4d5e-98e4-9e86d4472fbc.labels" -}}
helm.sh/chart: {{ include "go-echo78bd6bc3-6c7e-4d5e-98e4-9e86d4472fbc.chart" . }}
{{ include "go-echo78bd6bc3-6c7e-4d5e-98e4-9e86d4472fbc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo78bd6bc3-6c7e-4d5e-98e4-9e86d4472fbc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo78bd6bc3-6c7e-4d5e-98e4-9e86d4472fbc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}