
{{- define "go-echod859ce14-d219-4c05-a5a3-bccd03768957.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod859ce14-d219-4c05-a5a3-bccd03768957.fullname" -}}
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


{{- define "go-echod859ce14-d219-4c05-a5a3-bccd03768957.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod859ce14-d219-4c05-a5a3-bccd03768957.labels" -}}
helm.sh/chart: {{ include "go-echod859ce14-d219-4c05-a5a3-bccd03768957.chart" . }}
{{ include "go-echod859ce14-d219-4c05-a5a3-bccd03768957.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod859ce14-d219-4c05-a5a3-bccd03768957.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod859ce14-d219-4c05-a5a3-bccd03768957.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}