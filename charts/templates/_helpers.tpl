
{{- define "go-echoa8802e91-0fcd-48e1-b9b2-9b3bae5a5759.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa8802e91-0fcd-48e1-b9b2-9b3bae5a5759.fullname" -}}
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


{{- define "go-echoa8802e91-0fcd-48e1-b9b2-9b3bae5a5759.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa8802e91-0fcd-48e1-b9b2-9b3bae5a5759.labels" -}}
helm.sh/chart: {{ include "go-echoa8802e91-0fcd-48e1-b9b2-9b3bae5a5759.chart" . }}
{{ include "go-echoa8802e91-0fcd-48e1-b9b2-9b3bae5a5759.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa8802e91-0fcd-48e1-b9b2-9b3bae5a5759.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa8802e91-0fcd-48e1-b9b2-9b3bae5a5759.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}