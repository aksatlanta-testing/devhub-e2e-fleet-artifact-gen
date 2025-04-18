
{{- define "go-echo5f75c964-d23a-4c35-b360-540b5845934d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5f75c964-d23a-4c35-b360-540b5845934d.fullname" -}}
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


{{- define "go-echo5f75c964-d23a-4c35-b360-540b5845934d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5f75c964-d23a-4c35-b360-540b5845934d.labels" -}}
helm.sh/chart: {{ include "go-echo5f75c964-d23a-4c35-b360-540b5845934d.chart" . }}
{{ include "go-echo5f75c964-d23a-4c35-b360-540b5845934d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5f75c964-d23a-4c35-b360-540b5845934d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5f75c964-d23a-4c35-b360-540b5845934d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}