
{{- define "go-echod1768268-c724-4f15-ac24-9af05df6726c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1768268-c724-4f15-ac24-9af05df6726c.fullname" -}}
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


{{- define "go-echod1768268-c724-4f15-ac24-9af05df6726c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1768268-c724-4f15-ac24-9af05df6726c.labels" -}}
helm.sh/chart: {{ include "go-echod1768268-c724-4f15-ac24-9af05df6726c.chart" . }}
{{ include "go-echod1768268-c724-4f15-ac24-9af05df6726c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod1768268-c724-4f15-ac24-9af05df6726c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod1768268-c724-4f15-ac24-9af05df6726c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}