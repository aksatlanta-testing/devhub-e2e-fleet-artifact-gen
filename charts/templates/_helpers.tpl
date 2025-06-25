
{{- define "go-echobca6101c-9cc2-4fca-8dd3-a2bf4479928c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobca6101c-9cc2-4fca-8dd3-a2bf4479928c.fullname" -}}
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


{{- define "go-echobca6101c-9cc2-4fca-8dd3-a2bf4479928c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobca6101c-9cc2-4fca-8dd3-a2bf4479928c.labels" -}}
helm.sh/chart: {{ include "go-echobca6101c-9cc2-4fca-8dd3-a2bf4479928c.chart" . }}
{{ include "go-echobca6101c-9cc2-4fca-8dd3-a2bf4479928c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobca6101c-9cc2-4fca-8dd3-a2bf4479928c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobca6101c-9cc2-4fca-8dd3-a2bf4479928c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}