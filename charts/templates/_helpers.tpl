
{{- define "go-echoad062211-ab66-4d5a-9e7a-e35d17c700fc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad062211-ab66-4d5a-9e7a-e35d17c700fc.fullname" -}}
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


{{- define "go-echoad062211-ab66-4d5a-9e7a-e35d17c700fc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad062211-ab66-4d5a-9e7a-e35d17c700fc.labels" -}}
helm.sh/chart: {{ include "go-echoad062211-ab66-4d5a-9e7a-e35d17c700fc.chart" . }}
{{ include "go-echoad062211-ab66-4d5a-9e7a-e35d17c700fc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoad062211-ab66-4d5a-9e7a-e35d17c700fc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoad062211-ab66-4d5a-9e7a-e35d17c700fc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}