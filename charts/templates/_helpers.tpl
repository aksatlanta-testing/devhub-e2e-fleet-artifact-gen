
{{- define "go-echod3f8388d-6bd5-45d5-ae8c-ab4e455f07fe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod3f8388d-6bd5-45d5-ae8c-ab4e455f07fe.fullname" -}}
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


{{- define "go-echod3f8388d-6bd5-45d5-ae8c-ab4e455f07fe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod3f8388d-6bd5-45d5-ae8c-ab4e455f07fe.labels" -}}
helm.sh/chart: {{ include "go-echod3f8388d-6bd5-45d5-ae8c-ab4e455f07fe.chart" . }}
{{ include "go-echod3f8388d-6bd5-45d5-ae8c-ab4e455f07fe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod3f8388d-6bd5-45d5-ae8c-ab4e455f07fe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod3f8388d-6bd5-45d5-ae8c-ab4e455f07fe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}