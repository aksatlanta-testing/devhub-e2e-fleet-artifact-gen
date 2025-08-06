
{{- define "go-echod1e71961-dcb9-411b-ab11-a9faa7d5b405.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1e71961-dcb9-411b-ab11-a9faa7d5b405.fullname" -}}
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


{{- define "go-echod1e71961-dcb9-411b-ab11-a9faa7d5b405.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1e71961-dcb9-411b-ab11-a9faa7d5b405.labels" -}}
helm.sh/chart: {{ include "go-echod1e71961-dcb9-411b-ab11-a9faa7d5b405.chart" . }}
{{ include "go-echod1e71961-dcb9-411b-ab11-a9faa7d5b405.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod1e71961-dcb9-411b-ab11-a9faa7d5b405.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod1e71961-dcb9-411b-ab11-a9faa7d5b405.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}