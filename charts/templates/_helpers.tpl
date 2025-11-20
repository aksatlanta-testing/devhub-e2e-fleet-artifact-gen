
{{- define "go-echobc437c94-183a-469e-bf6a-139f0f43df9c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc437c94-183a-469e-bf6a-139f0f43df9c.fullname" -}}
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


{{- define "go-echobc437c94-183a-469e-bf6a-139f0f43df9c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc437c94-183a-469e-bf6a-139f0f43df9c.labels" -}}
helm.sh/chart: {{ include "go-echobc437c94-183a-469e-bf6a-139f0f43df9c.chart" . }}
{{ include "go-echobc437c94-183a-469e-bf6a-139f0f43df9c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobc437c94-183a-469e-bf6a-139f0f43df9c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobc437c94-183a-469e-bf6a-139f0f43df9c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}