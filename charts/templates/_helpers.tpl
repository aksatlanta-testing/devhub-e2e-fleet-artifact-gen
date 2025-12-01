
{{- define "go-echoab660b48-8d38-4cbc-b3fd-aa663ddd7a5b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab660b48-8d38-4cbc-b3fd-aa663ddd7a5b.fullname" -}}
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


{{- define "go-echoab660b48-8d38-4cbc-b3fd-aa663ddd7a5b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab660b48-8d38-4cbc-b3fd-aa663ddd7a5b.labels" -}}
helm.sh/chart: {{ include "go-echoab660b48-8d38-4cbc-b3fd-aa663ddd7a5b.chart" . }}
{{ include "go-echoab660b48-8d38-4cbc-b3fd-aa663ddd7a5b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoab660b48-8d38-4cbc-b3fd-aa663ddd7a5b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoab660b48-8d38-4cbc-b3fd-aa663ddd7a5b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}