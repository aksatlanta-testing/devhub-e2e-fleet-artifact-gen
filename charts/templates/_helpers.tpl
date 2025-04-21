
{{- define "go-echoe08fd4b5-2207-480a-900a-073c3fea5654.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe08fd4b5-2207-480a-900a-073c3fea5654.fullname" -}}
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


{{- define "go-echoe08fd4b5-2207-480a-900a-073c3fea5654.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe08fd4b5-2207-480a-900a-073c3fea5654.labels" -}}
helm.sh/chart: {{ include "go-echoe08fd4b5-2207-480a-900a-073c3fea5654.chart" . }}
{{ include "go-echoe08fd4b5-2207-480a-900a-073c3fea5654.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe08fd4b5-2207-480a-900a-073c3fea5654.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe08fd4b5-2207-480a-900a-073c3fea5654.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}