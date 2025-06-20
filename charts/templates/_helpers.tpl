
{{- define "go-echof25ab2a6-32b6-40ea-b21c-e18177aa7c73.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof25ab2a6-32b6-40ea-b21c-e18177aa7c73.fullname" -}}
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


{{- define "go-echof25ab2a6-32b6-40ea-b21c-e18177aa7c73.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof25ab2a6-32b6-40ea-b21c-e18177aa7c73.labels" -}}
helm.sh/chart: {{ include "go-echof25ab2a6-32b6-40ea-b21c-e18177aa7c73.chart" . }}
{{ include "go-echof25ab2a6-32b6-40ea-b21c-e18177aa7c73.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof25ab2a6-32b6-40ea-b21c-e18177aa7c73.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof25ab2a6-32b6-40ea-b21c-e18177aa7c73.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}