
{{- define "go-echo1f2fd370-196f-4d01-bed7-8f2e28c91e56.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1f2fd370-196f-4d01-bed7-8f2e28c91e56.fullname" -}}
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


{{- define "go-echo1f2fd370-196f-4d01-bed7-8f2e28c91e56.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1f2fd370-196f-4d01-bed7-8f2e28c91e56.labels" -}}
helm.sh/chart: {{ include "go-echo1f2fd370-196f-4d01-bed7-8f2e28c91e56.chart" . }}
{{ include "go-echo1f2fd370-196f-4d01-bed7-8f2e28c91e56.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1f2fd370-196f-4d01-bed7-8f2e28c91e56.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1f2fd370-196f-4d01-bed7-8f2e28c91e56.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}