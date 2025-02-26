
{{- define "go-echoebf5311e-c875-41c1-85c7-0ff0a1fa22c9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebf5311e-c875-41c1-85c7-0ff0a1fa22c9.fullname" -}}
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


{{- define "go-echoebf5311e-c875-41c1-85c7-0ff0a1fa22c9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebf5311e-c875-41c1-85c7-0ff0a1fa22c9.labels" -}}
helm.sh/chart: {{ include "go-echoebf5311e-c875-41c1-85c7-0ff0a1fa22c9.chart" . }}
{{ include "go-echoebf5311e-c875-41c1-85c7-0ff0a1fa22c9.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoebf5311e-c875-41c1-85c7-0ff0a1fa22c9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoebf5311e-c875-41c1-85c7-0ff0a1fa22c9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}