
{{- define "go-echod7c93db9-3ba0-4a66-b92e-58590284cb0c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7c93db9-3ba0-4a66-b92e-58590284cb0c.fullname" -}}
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


{{- define "go-echod7c93db9-3ba0-4a66-b92e-58590284cb0c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7c93db9-3ba0-4a66-b92e-58590284cb0c.labels" -}}
helm.sh/chart: {{ include "go-echod7c93db9-3ba0-4a66-b92e-58590284cb0c.chart" . }}
{{ include "go-echod7c93db9-3ba0-4a66-b92e-58590284cb0c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod7c93db9-3ba0-4a66-b92e-58590284cb0c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod7c93db9-3ba0-4a66-b92e-58590284cb0c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}