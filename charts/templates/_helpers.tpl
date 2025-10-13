
{{- define "go-echoa9b52621-63b3-43b3-ae29-4179bda1a20f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9b52621-63b3-43b3-ae29-4179bda1a20f.fullname" -}}
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


{{- define "go-echoa9b52621-63b3-43b3-ae29-4179bda1a20f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9b52621-63b3-43b3-ae29-4179bda1a20f.labels" -}}
helm.sh/chart: {{ include "go-echoa9b52621-63b3-43b3-ae29-4179bda1a20f.chart" . }}
{{ include "go-echoa9b52621-63b3-43b3-ae29-4179bda1a20f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa9b52621-63b3-43b3-ae29-4179bda1a20f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa9b52621-63b3-43b3-ae29-4179bda1a20f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}