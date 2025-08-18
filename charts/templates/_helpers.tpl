
{{- define "go-echo7caf2f3a-d1fa-4bc0-af41-0d3f9f8f4491.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7caf2f3a-d1fa-4bc0-af41-0d3f9f8f4491.fullname" -}}
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


{{- define "go-echo7caf2f3a-d1fa-4bc0-af41-0d3f9f8f4491.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7caf2f3a-d1fa-4bc0-af41-0d3f9f8f4491.labels" -}}
helm.sh/chart: {{ include "go-echo7caf2f3a-d1fa-4bc0-af41-0d3f9f8f4491.chart" . }}
{{ include "go-echo7caf2f3a-d1fa-4bc0-af41-0d3f9f8f4491.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7caf2f3a-d1fa-4bc0-af41-0d3f9f8f4491.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7caf2f3a-d1fa-4bc0-af41-0d3f9f8f4491.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}