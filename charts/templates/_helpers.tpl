
{{- define "go-echof422e28a-fc2d-4f96-8496-b4537baa1dae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof422e28a-fc2d-4f96-8496-b4537baa1dae.fullname" -}}
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


{{- define "go-echof422e28a-fc2d-4f96-8496-b4537baa1dae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof422e28a-fc2d-4f96-8496-b4537baa1dae.labels" -}}
helm.sh/chart: {{ include "go-echof422e28a-fc2d-4f96-8496-b4537baa1dae.chart" . }}
{{ include "go-echof422e28a-fc2d-4f96-8496-b4537baa1dae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof422e28a-fc2d-4f96-8496-b4537baa1dae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof422e28a-fc2d-4f96-8496-b4537baa1dae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}