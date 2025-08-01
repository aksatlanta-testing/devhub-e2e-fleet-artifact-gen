
{{- define "go-echo5c791612-d0f8-4ec7-bff8-e5c0bc5d00cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5c791612-d0f8-4ec7-bff8-e5c0bc5d00cb.fullname" -}}
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


{{- define "go-echo5c791612-d0f8-4ec7-bff8-e5c0bc5d00cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5c791612-d0f8-4ec7-bff8-e5c0bc5d00cb.labels" -}}
helm.sh/chart: {{ include "go-echo5c791612-d0f8-4ec7-bff8-e5c0bc5d00cb.chart" . }}
{{ include "go-echo5c791612-d0f8-4ec7-bff8-e5c0bc5d00cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5c791612-d0f8-4ec7-bff8-e5c0bc5d00cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5c791612-d0f8-4ec7-bff8-e5c0bc5d00cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}