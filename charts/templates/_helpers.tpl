
{{- define "go-echo59d1fd78-0529-4594-8ad5-fc6bbad8ed8d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo59d1fd78-0529-4594-8ad5-fc6bbad8ed8d.fullname" -}}
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


{{- define "go-echo59d1fd78-0529-4594-8ad5-fc6bbad8ed8d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo59d1fd78-0529-4594-8ad5-fc6bbad8ed8d.labels" -}}
helm.sh/chart: {{ include "go-echo59d1fd78-0529-4594-8ad5-fc6bbad8ed8d.chart" . }}
{{ include "go-echo59d1fd78-0529-4594-8ad5-fc6bbad8ed8d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo59d1fd78-0529-4594-8ad5-fc6bbad8ed8d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo59d1fd78-0529-4594-8ad5-fc6bbad8ed8d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}