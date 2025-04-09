
{{- define "go-echo0e24ef53-3f9f-4610-9776-fd5bd8c13fac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0e24ef53-3f9f-4610-9776-fd5bd8c13fac.fullname" -}}
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


{{- define "go-echo0e24ef53-3f9f-4610-9776-fd5bd8c13fac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0e24ef53-3f9f-4610-9776-fd5bd8c13fac.labels" -}}
helm.sh/chart: {{ include "go-echo0e24ef53-3f9f-4610-9776-fd5bd8c13fac.chart" . }}
{{ include "go-echo0e24ef53-3f9f-4610-9776-fd5bd8c13fac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0e24ef53-3f9f-4610-9776-fd5bd8c13fac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0e24ef53-3f9f-4610-9776-fd5bd8c13fac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}