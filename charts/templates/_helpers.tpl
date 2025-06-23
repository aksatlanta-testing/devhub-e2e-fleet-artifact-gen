
{{- define "go-echoa341991c-67b7-4582-b1fe-461a0954d924.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa341991c-67b7-4582-b1fe-461a0954d924.fullname" -}}
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


{{- define "go-echoa341991c-67b7-4582-b1fe-461a0954d924.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa341991c-67b7-4582-b1fe-461a0954d924.labels" -}}
helm.sh/chart: {{ include "go-echoa341991c-67b7-4582-b1fe-461a0954d924.chart" . }}
{{ include "go-echoa341991c-67b7-4582-b1fe-461a0954d924.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa341991c-67b7-4582-b1fe-461a0954d924.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa341991c-67b7-4582-b1fe-461a0954d924.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}