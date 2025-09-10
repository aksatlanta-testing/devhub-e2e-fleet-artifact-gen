
{{- define "go-echoaeda7b0e-29b1-4bd3-8e6a-202d253bd749.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaeda7b0e-29b1-4bd3-8e6a-202d253bd749.fullname" -}}
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


{{- define "go-echoaeda7b0e-29b1-4bd3-8e6a-202d253bd749.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaeda7b0e-29b1-4bd3-8e6a-202d253bd749.labels" -}}
helm.sh/chart: {{ include "go-echoaeda7b0e-29b1-4bd3-8e6a-202d253bd749.chart" . }}
{{ include "go-echoaeda7b0e-29b1-4bd3-8e6a-202d253bd749.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaeda7b0e-29b1-4bd3-8e6a-202d253bd749.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaeda7b0e-29b1-4bd3-8e6a-202d253bd749.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}