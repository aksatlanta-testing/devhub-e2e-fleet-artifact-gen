
{{- define "go-echod50da572-1a08-4922-8cf4-baf72abd8bfa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod50da572-1a08-4922-8cf4-baf72abd8bfa.fullname" -}}
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


{{- define "go-echod50da572-1a08-4922-8cf4-baf72abd8bfa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod50da572-1a08-4922-8cf4-baf72abd8bfa.labels" -}}
helm.sh/chart: {{ include "go-echod50da572-1a08-4922-8cf4-baf72abd8bfa.chart" . }}
{{ include "go-echod50da572-1a08-4922-8cf4-baf72abd8bfa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod50da572-1a08-4922-8cf4-baf72abd8bfa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod50da572-1a08-4922-8cf4-baf72abd8bfa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}