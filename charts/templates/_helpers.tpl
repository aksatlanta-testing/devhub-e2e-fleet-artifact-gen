
{{- define "go-echocc646e0e-16a3-4260-9806-2cb561f29b66.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc646e0e-16a3-4260-9806-2cb561f29b66.fullname" -}}
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


{{- define "go-echocc646e0e-16a3-4260-9806-2cb561f29b66.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc646e0e-16a3-4260-9806-2cb561f29b66.labels" -}}
helm.sh/chart: {{ include "go-echocc646e0e-16a3-4260-9806-2cb561f29b66.chart" . }}
{{ include "go-echocc646e0e-16a3-4260-9806-2cb561f29b66.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocc646e0e-16a3-4260-9806-2cb561f29b66.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocc646e0e-16a3-4260-9806-2cb561f29b66.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}