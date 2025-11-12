
{{- define "go-echoecc2cb40-8f7f-4c73-ab85-ae9d26a6185b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoecc2cb40-8f7f-4c73-ab85-ae9d26a6185b.fullname" -}}
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


{{- define "go-echoecc2cb40-8f7f-4c73-ab85-ae9d26a6185b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoecc2cb40-8f7f-4c73-ab85-ae9d26a6185b.labels" -}}
helm.sh/chart: {{ include "go-echoecc2cb40-8f7f-4c73-ab85-ae9d26a6185b.chart" . }}
{{ include "go-echoecc2cb40-8f7f-4c73-ab85-ae9d26a6185b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoecc2cb40-8f7f-4c73-ab85-ae9d26a6185b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoecc2cb40-8f7f-4c73-ab85-ae9d26a6185b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}