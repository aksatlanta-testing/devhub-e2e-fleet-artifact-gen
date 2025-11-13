
{{- define "go-echocc29cdef-e2d8-4172-a44f-2594ab388dcf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc29cdef-e2d8-4172-a44f-2594ab388dcf.fullname" -}}
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


{{- define "go-echocc29cdef-e2d8-4172-a44f-2594ab388dcf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc29cdef-e2d8-4172-a44f-2594ab388dcf.labels" -}}
helm.sh/chart: {{ include "go-echocc29cdef-e2d8-4172-a44f-2594ab388dcf.chart" . }}
{{ include "go-echocc29cdef-e2d8-4172-a44f-2594ab388dcf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocc29cdef-e2d8-4172-a44f-2594ab388dcf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocc29cdef-e2d8-4172-a44f-2594ab388dcf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}