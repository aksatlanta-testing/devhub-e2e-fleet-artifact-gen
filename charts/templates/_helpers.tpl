
{{- define "go-echod2f2b19f-abae-4c56-82a9-98ada94edc3c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2f2b19f-abae-4c56-82a9-98ada94edc3c.fullname" -}}
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


{{- define "go-echod2f2b19f-abae-4c56-82a9-98ada94edc3c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2f2b19f-abae-4c56-82a9-98ada94edc3c.labels" -}}
helm.sh/chart: {{ include "go-echod2f2b19f-abae-4c56-82a9-98ada94edc3c.chart" . }}
{{ include "go-echod2f2b19f-abae-4c56-82a9-98ada94edc3c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod2f2b19f-abae-4c56-82a9-98ada94edc3c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod2f2b19f-abae-4c56-82a9-98ada94edc3c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}