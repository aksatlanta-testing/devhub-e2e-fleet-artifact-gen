
{{- define "go-echo6d742543-bcf0-4edf-b16d-e8815f205f26.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6d742543-bcf0-4edf-b16d-e8815f205f26.fullname" -}}
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


{{- define "go-echo6d742543-bcf0-4edf-b16d-e8815f205f26.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6d742543-bcf0-4edf-b16d-e8815f205f26.labels" -}}
helm.sh/chart: {{ include "go-echo6d742543-bcf0-4edf-b16d-e8815f205f26.chart" . }}
{{ include "go-echo6d742543-bcf0-4edf-b16d-e8815f205f26.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6d742543-bcf0-4edf-b16d-e8815f205f26.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6d742543-bcf0-4edf-b16d-e8815f205f26.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}