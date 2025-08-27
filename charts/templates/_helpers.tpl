
{{- define "go-echode4490d5-b62a-4289-9609-5ed091ff9c80.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode4490d5-b62a-4289-9609-5ed091ff9c80.fullname" -}}
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


{{- define "go-echode4490d5-b62a-4289-9609-5ed091ff9c80.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode4490d5-b62a-4289-9609-5ed091ff9c80.labels" -}}
helm.sh/chart: {{ include "go-echode4490d5-b62a-4289-9609-5ed091ff9c80.chart" . }}
{{ include "go-echode4490d5-b62a-4289-9609-5ed091ff9c80.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echode4490d5-b62a-4289-9609-5ed091ff9c80.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echode4490d5-b62a-4289-9609-5ed091ff9c80.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}