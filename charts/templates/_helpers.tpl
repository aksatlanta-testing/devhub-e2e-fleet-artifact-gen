
{{- define "go-echobe7527ef-8183-4caf-b8e6-d5ed09b0d604.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe7527ef-8183-4caf-b8e6-d5ed09b0d604.fullname" -}}
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


{{- define "go-echobe7527ef-8183-4caf-b8e6-d5ed09b0d604.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe7527ef-8183-4caf-b8e6-d5ed09b0d604.labels" -}}
helm.sh/chart: {{ include "go-echobe7527ef-8183-4caf-b8e6-d5ed09b0d604.chart" . }}
{{ include "go-echobe7527ef-8183-4caf-b8e6-d5ed09b0d604.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobe7527ef-8183-4caf-b8e6-d5ed09b0d604.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobe7527ef-8183-4caf-b8e6-d5ed09b0d604.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}