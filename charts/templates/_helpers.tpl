
{{- define "go-echoa49a6c17-6f3f-4f34-a4b7-f634ed93972f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa49a6c17-6f3f-4f34-a4b7-f634ed93972f.fullname" -}}
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


{{- define "go-echoa49a6c17-6f3f-4f34-a4b7-f634ed93972f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa49a6c17-6f3f-4f34-a4b7-f634ed93972f.labels" -}}
helm.sh/chart: {{ include "go-echoa49a6c17-6f3f-4f34-a4b7-f634ed93972f.chart" . }}
{{ include "go-echoa49a6c17-6f3f-4f34-a4b7-f634ed93972f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa49a6c17-6f3f-4f34-a4b7-f634ed93972f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa49a6c17-6f3f-4f34-a4b7-f634ed93972f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}