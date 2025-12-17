
{{- define "go-echo0f3e1c63-7de8-4661-ba1c-a83c058d5899.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f3e1c63-7de8-4661-ba1c-a83c058d5899.fullname" -}}
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


{{- define "go-echo0f3e1c63-7de8-4661-ba1c-a83c058d5899.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f3e1c63-7de8-4661-ba1c-a83c058d5899.labels" -}}
helm.sh/chart: {{ include "go-echo0f3e1c63-7de8-4661-ba1c-a83c058d5899.chart" . }}
{{ include "go-echo0f3e1c63-7de8-4661-ba1c-a83c058d5899.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0f3e1c63-7de8-4661-ba1c-a83c058d5899.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0f3e1c63-7de8-4661-ba1c-a83c058d5899.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}