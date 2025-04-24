
{{- define "go-echocefd21a6-fd6e-4a39-adce-11d76489a9ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocefd21a6-fd6e-4a39-adce-11d76489a9ab.fullname" -}}
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


{{- define "go-echocefd21a6-fd6e-4a39-adce-11d76489a9ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocefd21a6-fd6e-4a39-adce-11d76489a9ab.labels" -}}
helm.sh/chart: {{ include "go-echocefd21a6-fd6e-4a39-adce-11d76489a9ab.chart" . }}
{{ include "go-echocefd21a6-fd6e-4a39-adce-11d76489a9ab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocefd21a6-fd6e-4a39-adce-11d76489a9ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocefd21a6-fd6e-4a39-adce-11d76489a9ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}