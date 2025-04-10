
{{- define "go-echoaabfa895-052f-4896-94f6-0941dbf5b61e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaabfa895-052f-4896-94f6-0941dbf5b61e.fullname" -}}
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


{{- define "go-echoaabfa895-052f-4896-94f6-0941dbf5b61e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaabfa895-052f-4896-94f6-0941dbf5b61e.labels" -}}
helm.sh/chart: {{ include "go-echoaabfa895-052f-4896-94f6-0941dbf5b61e.chart" . }}
{{ include "go-echoaabfa895-052f-4896-94f6-0941dbf5b61e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaabfa895-052f-4896-94f6-0941dbf5b61e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaabfa895-052f-4896-94f6-0941dbf5b61e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}