
{{- define "go-echo95e81c41-d2e0-4a8d-87bb-eceb93752eae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo95e81c41-d2e0-4a8d-87bb-eceb93752eae.fullname" -}}
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


{{- define "go-echo95e81c41-d2e0-4a8d-87bb-eceb93752eae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo95e81c41-d2e0-4a8d-87bb-eceb93752eae.labels" -}}
helm.sh/chart: {{ include "go-echo95e81c41-d2e0-4a8d-87bb-eceb93752eae.chart" . }}
{{ include "go-echo95e81c41-d2e0-4a8d-87bb-eceb93752eae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo95e81c41-d2e0-4a8d-87bb-eceb93752eae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo95e81c41-d2e0-4a8d-87bb-eceb93752eae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}