
{{- define "go-echo6e146eb2-8756-4c61-973a-e7f26dfee6af.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6e146eb2-8756-4c61-973a-e7f26dfee6af.fullname" -}}
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


{{- define "go-echo6e146eb2-8756-4c61-973a-e7f26dfee6af.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6e146eb2-8756-4c61-973a-e7f26dfee6af.labels" -}}
helm.sh/chart: {{ include "go-echo6e146eb2-8756-4c61-973a-e7f26dfee6af.chart" . }}
{{ include "go-echo6e146eb2-8756-4c61-973a-e7f26dfee6af.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6e146eb2-8756-4c61-973a-e7f26dfee6af.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6e146eb2-8756-4c61-973a-e7f26dfee6af.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}