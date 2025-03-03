
{{- define "go-echo06ebdf56-f3a2-4bd2-8807-066a613092aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo06ebdf56-f3a2-4bd2-8807-066a613092aa.fullname" -}}
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


{{- define "go-echo06ebdf56-f3a2-4bd2-8807-066a613092aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo06ebdf56-f3a2-4bd2-8807-066a613092aa.labels" -}}
helm.sh/chart: {{ include "go-echo06ebdf56-f3a2-4bd2-8807-066a613092aa.chart" . }}
{{ include "go-echo06ebdf56-f3a2-4bd2-8807-066a613092aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo06ebdf56-f3a2-4bd2-8807-066a613092aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo06ebdf56-f3a2-4bd2-8807-066a613092aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}