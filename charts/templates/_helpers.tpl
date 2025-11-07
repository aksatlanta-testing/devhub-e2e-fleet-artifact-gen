
{{- define "go-echo769a1eb9-8b71-4f26-a2e4-1f7b7d319667.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo769a1eb9-8b71-4f26-a2e4-1f7b7d319667.fullname" -}}
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


{{- define "go-echo769a1eb9-8b71-4f26-a2e4-1f7b7d319667.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo769a1eb9-8b71-4f26-a2e4-1f7b7d319667.labels" -}}
helm.sh/chart: {{ include "go-echo769a1eb9-8b71-4f26-a2e4-1f7b7d319667.chart" . }}
{{ include "go-echo769a1eb9-8b71-4f26-a2e4-1f7b7d319667.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo769a1eb9-8b71-4f26-a2e4-1f7b7d319667.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo769a1eb9-8b71-4f26-a2e4-1f7b7d319667.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}