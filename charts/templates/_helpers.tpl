
{{- define "go-echoc68229eb-83fc-4503-b0c3-1db9ad388031.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc68229eb-83fc-4503-b0c3-1db9ad388031.fullname" -}}
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


{{- define "go-echoc68229eb-83fc-4503-b0c3-1db9ad388031.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc68229eb-83fc-4503-b0c3-1db9ad388031.labels" -}}
helm.sh/chart: {{ include "go-echoc68229eb-83fc-4503-b0c3-1db9ad388031.chart" . }}
{{ include "go-echoc68229eb-83fc-4503-b0c3-1db9ad388031.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc68229eb-83fc-4503-b0c3-1db9ad388031.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc68229eb-83fc-4503-b0c3-1db9ad388031.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}