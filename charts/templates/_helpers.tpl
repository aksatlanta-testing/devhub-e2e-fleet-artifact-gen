
{{- define "go-echocb052c14-65df-428f-bd11-4a5a9aace67a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb052c14-65df-428f-bd11-4a5a9aace67a.fullname" -}}
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


{{- define "go-echocb052c14-65df-428f-bd11-4a5a9aace67a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb052c14-65df-428f-bd11-4a5a9aace67a.labels" -}}
helm.sh/chart: {{ include "go-echocb052c14-65df-428f-bd11-4a5a9aace67a.chart" . }}
{{ include "go-echocb052c14-65df-428f-bd11-4a5a9aace67a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocb052c14-65df-428f-bd11-4a5a9aace67a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocb052c14-65df-428f-bd11-4a5a9aace67a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}