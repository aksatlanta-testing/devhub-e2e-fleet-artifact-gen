
{{- define "go-echofd00c9d5-bbf0-4e9f-ba59-7475f9b5d713.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd00c9d5-bbf0-4e9f-ba59-7475f9b5d713.fullname" -}}
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


{{- define "go-echofd00c9d5-bbf0-4e9f-ba59-7475f9b5d713.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd00c9d5-bbf0-4e9f-ba59-7475f9b5d713.labels" -}}
helm.sh/chart: {{ include "go-echofd00c9d5-bbf0-4e9f-ba59-7475f9b5d713.chart" . }}
{{ include "go-echofd00c9d5-bbf0-4e9f-ba59-7475f9b5d713.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofd00c9d5-bbf0-4e9f-ba59-7475f9b5d713.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofd00c9d5-bbf0-4e9f-ba59-7475f9b5d713.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}