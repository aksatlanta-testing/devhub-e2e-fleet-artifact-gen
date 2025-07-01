
{{- define "go-echobb0fcd71-8687-4cbc-9534-9dc1b2ef1c7e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb0fcd71-8687-4cbc-9534-9dc1b2ef1c7e.fullname" -}}
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


{{- define "go-echobb0fcd71-8687-4cbc-9534-9dc1b2ef1c7e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb0fcd71-8687-4cbc-9534-9dc1b2ef1c7e.labels" -}}
helm.sh/chart: {{ include "go-echobb0fcd71-8687-4cbc-9534-9dc1b2ef1c7e.chart" . }}
{{ include "go-echobb0fcd71-8687-4cbc-9534-9dc1b2ef1c7e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobb0fcd71-8687-4cbc-9534-9dc1b2ef1c7e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobb0fcd71-8687-4cbc-9534-9dc1b2ef1c7e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}