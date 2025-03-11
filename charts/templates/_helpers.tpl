
{{- define "go-echo4db9ace4-2db7-4c5d-b8c7-a6eeacfcf0ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4db9ace4-2db7-4c5d-b8c7-a6eeacfcf0ea.fullname" -}}
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


{{- define "go-echo4db9ace4-2db7-4c5d-b8c7-a6eeacfcf0ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4db9ace4-2db7-4c5d-b8c7-a6eeacfcf0ea.labels" -}}
helm.sh/chart: {{ include "go-echo4db9ace4-2db7-4c5d-b8c7-a6eeacfcf0ea.chart" . }}
{{ include "go-echo4db9ace4-2db7-4c5d-b8c7-a6eeacfcf0ea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4db9ace4-2db7-4c5d-b8c7-a6eeacfcf0ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4db9ace4-2db7-4c5d-b8c7-a6eeacfcf0ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}