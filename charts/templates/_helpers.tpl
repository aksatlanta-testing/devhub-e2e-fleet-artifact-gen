
{{- define "go-echo876b03e7-fe50-4d64-a061-8b8c05167a93.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo876b03e7-fe50-4d64-a061-8b8c05167a93.fullname" -}}
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


{{- define "go-echo876b03e7-fe50-4d64-a061-8b8c05167a93.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo876b03e7-fe50-4d64-a061-8b8c05167a93.labels" -}}
helm.sh/chart: {{ include "go-echo876b03e7-fe50-4d64-a061-8b8c05167a93.chart" . }}
{{ include "go-echo876b03e7-fe50-4d64-a061-8b8c05167a93.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo876b03e7-fe50-4d64-a061-8b8c05167a93.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo876b03e7-fe50-4d64-a061-8b8c05167a93.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}