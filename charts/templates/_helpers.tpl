
{{- define "go-echo41c3c98d-b067-481f-91c6-039f9ccbd9ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo41c3c98d-b067-481f-91c6-039f9ccbd9ee.fullname" -}}
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


{{- define "go-echo41c3c98d-b067-481f-91c6-039f9ccbd9ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo41c3c98d-b067-481f-91c6-039f9ccbd9ee.labels" -}}
helm.sh/chart: {{ include "go-echo41c3c98d-b067-481f-91c6-039f9ccbd9ee.chart" . }}
{{ include "go-echo41c3c98d-b067-481f-91c6-039f9ccbd9ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo41c3c98d-b067-481f-91c6-039f9ccbd9ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo41c3c98d-b067-481f-91c6-039f9ccbd9ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}