
{{- define "go-echod1634872-2086-4386-8819-bdfd485b62ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1634872-2086-4386-8819-bdfd485b62ab.fullname" -}}
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


{{- define "go-echod1634872-2086-4386-8819-bdfd485b62ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1634872-2086-4386-8819-bdfd485b62ab.labels" -}}
helm.sh/chart: {{ include "go-echod1634872-2086-4386-8819-bdfd485b62ab.chart" . }}
{{ include "go-echod1634872-2086-4386-8819-bdfd485b62ab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod1634872-2086-4386-8819-bdfd485b62ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod1634872-2086-4386-8819-bdfd485b62ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}