
{{- define "go-echo57dbc849-8f0d-4a18-b5df-355fd8ffd455.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57dbc849-8f0d-4a18-b5df-355fd8ffd455.fullname" -}}
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


{{- define "go-echo57dbc849-8f0d-4a18-b5df-355fd8ffd455.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57dbc849-8f0d-4a18-b5df-355fd8ffd455.labels" -}}
helm.sh/chart: {{ include "go-echo57dbc849-8f0d-4a18-b5df-355fd8ffd455.chart" . }}
{{ include "go-echo57dbc849-8f0d-4a18-b5df-355fd8ffd455.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo57dbc849-8f0d-4a18-b5df-355fd8ffd455.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo57dbc849-8f0d-4a18-b5df-355fd8ffd455.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}