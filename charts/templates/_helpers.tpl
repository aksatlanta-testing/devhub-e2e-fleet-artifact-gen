
{{- define "go-echofb7c206c-1df6-4efc-bf80-9f9d371819be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb7c206c-1df6-4efc-bf80-9f9d371819be.fullname" -}}
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


{{- define "go-echofb7c206c-1df6-4efc-bf80-9f9d371819be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb7c206c-1df6-4efc-bf80-9f9d371819be.labels" -}}
helm.sh/chart: {{ include "go-echofb7c206c-1df6-4efc-bf80-9f9d371819be.chart" . }}
{{ include "go-echofb7c206c-1df6-4efc-bf80-9f9d371819be.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofb7c206c-1df6-4efc-bf80-9f9d371819be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofb7c206c-1df6-4efc-bf80-9f9d371819be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}