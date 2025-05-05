
{{- define "go-echob9164ad9-c199-46b9-8e32-a471380ccf9c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9164ad9-c199-46b9-8e32-a471380ccf9c.fullname" -}}
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


{{- define "go-echob9164ad9-c199-46b9-8e32-a471380ccf9c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9164ad9-c199-46b9-8e32-a471380ccf9c.labels" -}}
helm.sh/chart: {{ include "go-echob9164ad9-c199-46b9-8e32-a471380ccf9c.chart" . }}
{{ include "go-echob9164ad9-c199-46b9-8e32-a471380ccf9c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob9164ad9-c199-46b9-8e32-a471380ccf9c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob9164ad9-c199-46b9-8e32-a471380ccf9c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}