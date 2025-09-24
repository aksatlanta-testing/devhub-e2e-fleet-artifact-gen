
{{- define "go-echoe7b7b824-d901-4091-a7d6-2aabd03b19fb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe7b7b824-d901-4091-a7d6-2aabd03b19fb.fullname" -}}
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


{{- define "go-echoe7b7b824-d901-4091-a7d6-2aabd03b19fb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe7b7b824-d901-4091-a7d6-2aabd03b19fb.labels" -}}
helm.sh/chart: {{ include "go-echoe7b7b824-d901-4091-a7d6-2aabd03b19fb.chart" . }}
{{ include "go-echoe7b7b824-d901-4091-a7d6-2aabd03b19fb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe7b7b824-d901-4091-a7d6-2aabd03b19fb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe7b7b824-d901-4091-a7d6-2aabd03b19fb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}