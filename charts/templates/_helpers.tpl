
{{- define "go-echof6eb8faa-2e10-4048-bf71-5f4cc7a00740.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof6eb8faa-2e10-4048-bf71-5f4cc7a00740.fullname" -}}
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


{{- define "go-echof6eb8faa-2e10-4048-bf71-5f4cc7a00740.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof6eb8faa-2e10-4048-bf71-5f4cc7a00740.labels" -}}
helm.sh/chart: {{ include "go-echof6eb8faa-2e10-4048-bf71-5f4cc7a00740.chart" . }}
{{ include "go-echof6eb8faa-2e10-4048-bf71-5f4cc7a00740.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof6eb8faa-2e10-4048-bf71-5f4cc7a00740.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof6eb8faa-2e10-4048-bf71-5f4cc7a00740.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}