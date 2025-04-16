
{{- define "go-echob5c55ce1-6514-4d8c-b5ef-de4c2d478df3.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5c55ce1-6514-4d8c-b5ef-de4c2d478df3.fullname" -}}
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


{{- define "go-echob5c55ce1-6514-4d8c-b5ef-de4c2d478df3.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5c55ce1-6514-4d8c-b5ef-de4c2d478df3.labels" -}}
helm.sh/chart: {{ include "go-echob5c55ce1-6514-4d8c-b5ef-de4c2d478df3.chart" . }}
{{ include "go-echob5c55ce1-6514-4d8c-b5ef-de4c2d478df3.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob5c55ce1-6514-4d8c-b5ef-de4c2d478df3.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob5c55ce1-6514-4d8c-b5ef-de4c2d478df3.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}