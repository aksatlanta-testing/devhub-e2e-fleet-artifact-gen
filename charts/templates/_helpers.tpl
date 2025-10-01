
{{- define "go-echoaf6b1ea6-da6f-40c7-a1b9-0a5c0c1433bc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf6b1ea6-da6f-40c7-a1b9-0a5c0c1433bc.fullname" -}}
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


{{- define "go-echoaf6b1ea6-da6f-40c7-a1b9-0a5c0c1433bc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf6b1ea6-da6f-40c7-a1b9-0a5c0c1433bc.labels" -}}
helm.sh/chart: {{ include "go-echoaf6b1ea6-da6f-40c7-a1b9-0a5c0c1433bc.chart" . }}
{{ include "go-echoaf6b1ea6-da6f-40c7-a1b9-0a5c0c1433bc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaf6b1ea6-da6f-40c7-a1b9-0a5c0c1433bc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaf6b1ea6-da6f-40c7-a1b9-0a5c0c1433bc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}