
{{- define "go-echo10bf2c66-0695-4a7e-9436-5aeed250e0dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo10bf2c66-0695-4a7e-9436-5aeed250e0dd.fullname" -}}
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


{{- define "go-echo10bf2c66-0695-4a7e-9436-5aeed250e0dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo10bf2c66-0695-4a7e-9436-5aeed250e0dd.labels" -}}
helm.sh/chart: {{ include "go-echo10bf2c66-0695-4a7e-9436-5aeed250e0dd.chart" . }}
{{ include "go-echo10bf2c66-0695-4a7e-9436-5aeed250e0dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo10bf2c66-0695-4a7e-9436-5aeed250e0dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo10bf2c66-0695-4a7e-9436-5aeed250e0dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}