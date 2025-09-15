
{{- define "go-echo4f073e24-5969-4a10-aa8f-3d4de18a3ce6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4f073e24-5969-4a10-aa8f-3d4de18a3ce6.fullname" -}}
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


{{- define "go-echo4f073e24-5969-4a10-aa8f-3d4de18a3ce6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4f073e24-5969-4a10-aa8f-3d4de18a3ce6.labels" -}}
helm.sh/chart: {{ include "go-echo4f073e24-5969-4a10-aa8f-3d4de18a3ce6.chart" . }}
{{ include "go-echo4f073e24-5969-4a10-aa8f-3d4de18a3ce6.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4f073e24-5969-4a10-aa8f-3d4de18a3ce6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4f073e24-5969-4a10-aa8f-3d4de18a3ce6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}